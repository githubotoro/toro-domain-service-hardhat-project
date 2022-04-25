// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

// importing OpenZeppelin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import {StringUtils} from "./libraries/StringUtils.sol";
import {Base64} from "./libraries/Base64.sol";
import "hardhat/console.sol";

contract Domains is ERC721URIStorage {
    // variable for tracking total domains minted
    uint256 public totalDomains;

    // declaring custom errors
    error Unauthorized();
    error AlreadyRegistered();
    error InvalidName(string name);

    // creating global owner
    address payable public owner;

    // magic from OpenZeppelin to track tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // tld records the ending of our domain = .toro
    string public tld;

    // storing NFTs on chain as SVGs
    string svgPartOne =
        '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1080 1080"><defs><style>.cls-1{fill:url(#linear-gradient);}.cls-2,.cls-3{font-size:49.82px;}.cls-2,.cls-3,.cls-4,.cls-5,.cls-6,.cls-7,.cls-8,.cls-9{font-family:FranklinGothic-Heavy, Franklin Gothic Heavy;font-weight:800;}.cls-3,.cls-5,.cls-7,.cls-9{fill:#fff;}.cls-4,.cls-5{font-size:70.91px;}.cls-6,.cls-7{font-size:86.06px;}.cls-8,.cls-9{font-size:65.06px;}</style><linearGradient id="linear-gradient" x1="1080" y1="1080" x2="0" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#a51ff0"/><stop offset="1" stop-color="#20d4f6"/></linearGradient></defs><g id="final-gradient"><rect class="cls-1" width="1080" height="1080"/></g><g id="final-text"><text class="cls-2" transform="translate(787.92 1031.88)">#stayTORO</text><text class="cls-3" transform="translate(784.92 1028.88)">#stayTORO</text><text class="cls-2" transform="translate(43 1031.88)">';
    string svgPartTwo =
        '</text><text class="cls-3" transform="translate(40 1028.88)">';
    string svgPartThree =
        '</text><text class="cls-4" transform="translate(371.13 210.81)">@totorulla</text><text class="cls-5" transform="translate(368.13 207.81)">@totorulla</text><text class="cls-6" transform="translate(129.57 126.73)">Toro Domain Service</text><text class="cls-7" transform="translate(126.57 123.73)">Toro Domain Service</text><text x="50%" text-anchor="middle" class="cls-8" transform="translate(23.26 564.56)">';
    string svgPartFour =
        '</text><text x="50%" text-anchor="middle" class="cls-9" transform="translate(20.26 561.56)">';
    string svgPartFive = "</text></g></svg>";

    // domains mapping will store all the domain names to corresponding address
    mapping(uint256 => string) public names;

    // domains mapping will store all the domain names
    mapping(string => address) public domains;

    // domainIds mapping will store all the domain ids
    mapping(string => uint256) public domainIds;

    // records mapping will store all the values
    mapping(string => string) public records;

    // this contract is payable
    constructor(string memory _tld)
        payable
        ERC721("Toro Domain Service", "TDS")
    {
        owner = payable(msg.sender);
        tld = _tld;
        console.log("%s name service has been deployed", _tld);
        totalDomains = 1;
    }

    // function to get all names of a particular address
    function getAllNames() public view returns (string[] memory) {
        console.log("Getting all names from contract");

        string[] memory allNames = new string[](_tokenIds.current());

        for (uint256 i = 0; i < _tokenIds.current(); i++) {
            allNames[i] = names[i];
            console.log("Name for token %d is %s", i, allNames[i]);
        }

        return allNames;
    }

    // price function will give us the price for minting a domain
    function price(string calldata name) public pure returns (uint256) {
        uint256 len = StringUtils.strlen(name);

        require(len > 0);
        return 0.1 * 10**17;
    }

    // function to check if entered name is within limit or not
    function valid(string calldata name) public pure returns (bool) {
        return StringUtils.strlen(name) >= 3 && StringUtils.strlen(name) <= 25;
    }

    // function ro get length of a string
    function getStrLen(string memory _str) public pure returns (uint256) {
        uint256 len = bytes(_str).length;
        return len;
    }

    // register function will add names to domains mapping
    function register(string calldata name) public payable {
        // if name is not valid, revert back
        if (!valid(name)) revert InvalidName(name);

        // checking that domain name is unregistered
        if (domains[name] != address(0)) revert AlreadyRegistered();

        // checking if required matic was paid for the transaction
        uint256 _price = price(name);
        require(msg.value >= _price, "Not Enough Matic Paid!");

        uint256 newRecordId = _tokenIds.current();
        uint256 length = StringUtils.strlen(name);
        string memory strLen = Strings.toString(length);

        console.log(
            "Registering %s.%s on the contract with tokenID %d",
            name,
            tld,
            newRecordId
        );

        // combining name passed with TLD
        string memory _name = string(abi.encodePacked(name, ".", tld));
        string memory _namedomain = string(
            abi.encodePacked("ToroDomain#", Strings.toString(newRecordId))
        );

        // creating final SVG
        string memory finalSvg = string(
            abi.encodePacked(
                svgPartOne,
                _namedomain,
                svgPartTwo,
                _namedomain,
                svgPartThree,
                _name,
                svgPartFour,
                _name,
                svgPartFive
            )
        );

        // creating JSON metadata for NFT
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        _name,
                        '", "description": "Toro Domain Service", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '","length":"',
                        strLen,
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenURI = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
        console.log("Final TokenURI is : ", finalTokenURI);

        // minting NFT
        _safeMint(msg.sender, newRecordId);
        _setTokenURI(newRecordId, finalTokenURI);

        domains[name] = msg.sender;
        console.log("%s has registered a domain!", msg.sender);

        names[newRecordId] = name;

        totalDomains += 1;

        domainIds[name] = newRecordId;
        _tokenIds.increment();
    }

    // getAddress function will give us the domain owners' address
    function getAddress(string calldata name) public view returns (address) {
        return domains[name];
    }

    // setRecord function will set the record for domain name
    function setRecord(string calldata name, string calldata record) public {
        if (msg.sender != domains[name]) revert Unauthorized();
        records[name] = record;
    }

    // getRecord function will get the record for domain name
    function getRecord(string calldata name)
        public
        view
        returns (string memory)
    {
        return records[name];
    }

    // modifier for owner
    modifier onlyOwner() {
        require(isOwner());
        _;
    }

    // checking msg.sender is owner or not
    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }

    // withdraw function
    function withdraw() public onlyOwner {
        uint256 amount = address(this).balance;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Failed to withdraw Matic");
    }

    // function to get total number of domains
    function getTotalDomains() public view returns (uint256) {
        return totalDomains;
    }

    // funtion to get total funds of the contract
    function getTotalFunds() public view returns (uint256) {
        return address(this).balance;
    }

    // funtion to get domain id
    function getDomainId(string calldata name) public view returns (uint256) {
        return domainIds[name];
    }
}
