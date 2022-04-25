<!-- PROJECT HEADER -->

<br />
<div align="center">
  <a href="https://toro-domain-service.vercel.app/">
    <img src="images/logo.png" alt="logo" height="50">
    <h1>TORO DOMAIN SERVICE <br/>Your immortal .toro on Polygon!</h1>
  </a>
  
  <p align="center">
    <a href="https://toro-domain-service.vercel.app/"><strong>#stayTORO »</strong></a>
    <br />
    <a href="https://toro-domain-service.vercel.app/">View Project</a>
    |
    <a href="https://github.com/githubotoro/toro-domain-service-hardhat-project/issues">Report Bug</a>
    |
    <a href="https://github.com/githubotoro/toro-domain-service-hardhat-project/issues">Request Feature</a>
    <br/>
    <a href="https://opensea.io/collection/totorulla">OpenSea</a>
    |
    <a href="https://twitter.com/totorulla">Twitter</a>
    |
    <a href="https://www.instagram.com/totorulla/">Instagram</a> <br/> <br/>
    <b>If you like this project, don't forget to give it a star! <br/> Thanks! 😊</b>
  </p>
  
</div>

<!-- PROJECT HEADER -->

<!-- TABLE OF CONTENTS -->

## Table of Contents 📌

  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgments</a></li>
  </ol>

<!-- ABOUT THE PROJECT -->

<a name="about-the-project"></a>

## About The Project 📝

<div align="center">
<a href="https://opensea.io/collection/totorulla">
    <img src="images/totorulla-title.png" alt="logo" height="100">
</a>
</div>

Totorulla is a hand-drawn totogenic NFT collection of Totoru Family on OpenSea. This project is the official expansion for the community where everyone can be part of "Totoru Family" by minting their own .toro domain on Polygon. Join the totoric world of "Totoru Family" and be that "Totorulla" which was hidden inside you all along. 👀

<!-- ABOUT THE PROJECT -->

<!-- BUILT WITH -->

<a name="built-with"></a>

### Built With 🔍

-   [Hardhat](https://hardhat.org/)
-   [Solidity](https://docs.soliditylang.org/en/v0.8.12/)
-   [OpenZeppelin](https://openzeppelin.com/contracts/)
-   [Alchemy](https://www.alchemy.com/)

<!-- BUILT WITH -->

<!-- GETTING STARTED -->

<a name="getting-started"></a>

## Getting Started 🚀

All you need to get started with this toroic project is your **toroness!** 😄

<a name="installation"></a>

### Installation 💻

1.  **Clone** this repo.

    ```sh
    git clone https://github.com/githubotoro/toro-domain-service-hardhat-project.git
    ```

2.  Get your own **Alchemy API Key** on **"Polygon Mumbai Testnet"** from **[Alchemy](https://www.alchemy.com/).** Get your **Private Key** under Account Details from Metamask. Make a **.env** file in the root directory and enter the following lines.

    ```sh
    ALCHEMY_KEY = "YOUR_ALCHEMY_API_KEY"
    PRIVATE_KEY = "YOUR_PRIVATE_KEY"
    ```

    > **NOTE: Never push .env file to GitHub or you would lose all your funds as Mainnet and Testnet share the same Private Key.**

3.  **Install** NPM packages.

    ```sh
    npm install
    ```

4.  Modify **Domains.sol** under **/contracts** and **run.js (Locally)**, **deploy.js (Polygon Testnet)** under **/scripts** as per your requirements.

5.  Deploying and testing **(Locally)**.
    ```sh
    npx hardhat run scrips/run.js
    ```
6.  Deploying and testing **(Polygon Testnet)**. If you don't have **MATIC**, get some for free from **[Polygon Faucet](https://faucet.polygon.technology/)** for deployment and making transactions.
    ```sh
    npx hardhat run scrips/deploy.js --network mumbai
    ```
7.  **(Optional)** Refer this **[toro-domain-service-web3-app](https://github.com/githubotoro/toro-domain-service-web3-app)** project to make a **live web3 project** for interacting with deployed smart contract.
    > **NOTE: Write down contract deployement address from console after deployment and don't forget to update CONTRACT_ADDRESS and contractABI.json in your web3 app.**
8.  **Happy TOROing!**

<!-- GETTING STARTED -->

<!-- CONTRIBUTING -->

<a name="contributing"></a>

## Contributing 🤝

Totorulla is a community project and any contributions you make are greatly appreciated. If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "toro". 🏷

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/ToroFeature`)
3. Commit your Changes (`git commit -m 'Add some ToroFeature'`)
4. Push to the Branch (`git push origin feature/ToroFeature`)
5. Open a Pull Request

<!-- CONTRIBUTING -->

<!-- LICENSE -->

<a name="license"></a>

## License 📃

Distributed under the **MIT License**. See `LICENSE` for more information.

<!-- LICENSE -->

<!-- CONTACT -->

<a name="contact"></a>

## Contact ☎️

> **Totorulla NFT Collection** : [OpenSea](https://opensea.io/collection/totorulla) | [Instagram](https://www.instagram.com/totorulla/)

-   **Twitter** - [tororulla](https://twitter.com/totorulla)
-   **Email** - totorullas@gmail.com

> **Project Link** : [https://github.com/githubotoro/toro-domain-service-hardhat-project](https://github.com/githubotoro/toro-domain-service-hardhat-project)

<!-- CONTACT -->

<!-- ACKNOWLEDGMENTS -->

<a name="acknowledgements"></a>

## Acknowledgments 🙌

-   [Buildspace](https://buildspace.so/)
-   [Choose an Open Source License](https://choosealicense.com)
-   [Get Emoji](https://getemoji.com/)

<!-- ACKNOWLEDGMENTS -->

<div align="center">
  <a href="https://opensea.io/collection/totorulla">
    <img src="images/totorulla-character-icon.png" alt="logo" width="250" height="250">
    <h1>Till then, #stayTORO 👋</h1>
  </a>
</div>
