// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

// Basic implementation of the ERC721 standard
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// adds functionality for storing and managing metadata URIs associated
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// Used for access control
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, ERC721URIStorage, Ownable {

    // Ids auto increment to create unique ids
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("MyNFT", "MNT")
        Ownable(initialOwner)
    {}

    // Mints NFT
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}