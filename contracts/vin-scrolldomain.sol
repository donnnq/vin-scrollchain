// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VinScrolldomain is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public domainNames;
    mapping(string => bool) public domainTaken;

    event DomainClaimed(address indexed claimant, string domain, uint256 tokenId);
    event DomainBound(uint256 indexed tokenId, string subdomain);
    event RegistryUpdated(string domain, string metadata);

    constructor() ERC721("VinScrolldomain", "VSD") {}

    function claimDomain(string memory domain) public {
        require(!domainTaken[domain], "Domain already claimed");

        uint256 tokenId = nextTokenId;
        nextTokenId++;

        _safeMint(msg.sender, tokenId);
        domainNames[tokenId] = domain;
        domainTaken[domain] = true;

        emit DomainClaimed(msg.sender, domain, tokenId);
    }

    function bindSubdomain(uint256 tokenId, string memory subdomain) public {
        require(ownerOf(tokenId) == msg.sender, "Not owner of domain");
        emit DomainBound(tokenId, subdomain);
    }

    function updateRegistry(string memory domain, string memory metadata) public onlyOwner {
        emit RegistryUpdated(domain, metadata);
    }

    function getDomain(uint256 tokenId) public view returns (string memory) {
        return domainNames[tokenId];
    }
}
