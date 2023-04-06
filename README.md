<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://getfexr.com">
    <img src="https://getfexr.com/img/logo.svg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">sky</h3>

  <p align="center">
    Decentralized Identity Firewall for Fexr services
    <br />
    <a href="https://getfexr.com"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="">View Demo</a>
    ·
    <a href="https://github.com/getfexr/sky/issues">Report Bug</a>
    ·
    <a href="https://github.com/getfexr/sky/issues">Request Feature</a>
  </p>
</div>

<!-- USAGE EXAMPLES -->
## Usage

In a decentralized identity management system, like the one used in the Decentralized Identity Firewall for Fexr Services, the private keys are not stored by Sky or any other central authority. Instead, the private keys are stored within a self-custody wallet, which can be a browser extension, mobile app, or other application that enables users to control their own private keys.

Here's a more detailed description of how the system works:

1. User creates a Decentralized Identity (DID): The user creates a new DID using their self-custody wallet. This DID is a unique identifier that the user will use to interact with Fexr and other decentralized financial services providers.

2. User requests access to Fexr services: The user requests access to Fexr services by providing their DID to Fexr. Fexr generates a content request that the user must sign with their private key.

3. User signs content request: The user signs the content request with their private key, which is stored within their self-custody wallet. The signed content request includes the user's DID and a request for specific personal information to be shared with Fexr.

4. Verification process: The signed content request is then verified by Sky. Sky ensures that the content request was signed by the user's private key and that the user has authorized the sharing of their personal information with Fexr.

5. Access token issued: If the verification process is successful, Sky issues an access token to the user's DID. This access token is a unique identifier that Fexr can use to access the user's personal information.

6. Access granted: The user's self-custody wallet then grants access to Fexr, enabling Fexr to access the user's personal information.

It's important to note that the private keys are never shared with Sky or any other central authority. The self-custody wallet stores the private keys, and the user controls access to their personal information by signing content requests and granting access tokens.

This decentralized identity management system provides enhanced security and privacy for user identities and personal information. It ensures that users have full control over their personal information and can revoke access at any time.


<!-- BUILDING -->
## Running Locally

## Build

```bash
./fexrsky-<build>.<ext>
```

## Code

```bash
go run fexr.go
```

<p align="right">(<a href="#top">back to top</a>)</p>

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Your Name - [@getfexr](https://twitter.com/getfexr) - support@getfexr.com

Project Link: [https://github.com/getfexr/sky](https://github.com/getfexr/sky)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
