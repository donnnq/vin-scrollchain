// SPDX-License-Identifier: Civic-Echo
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract vinEchoOfDignity is ERC721URIStorage {
    address public echoMaster;
    uint256 public tokenCount;

    modifier onlyEchoMaster() {
        require(msg.sender == echoMaster, "Unauthorized minting access");
        _;
    }

    constructor() ERC721("EchoOfDignity", "EOD") {
        echoMaster = msg.sender;
        tokenCount = 0;
    }

    function mintMedallion(address to, string calldata metadataURI) external onlyEchoMaster {
        tokenCount++;
        _mint(to, tokenCount);
        _setTokenURI(tokenCount, metadataURI);
    }
}
