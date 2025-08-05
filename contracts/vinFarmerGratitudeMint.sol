pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract vinFarmerGratitudeMint is ERC721URIStorage {
    uint256 public tokenCounter;
    address public daoMaster;

    constructor(address _daoMaster) ERC721("FarmerGratitudeNFT", "FGR") {
        tokenCounter = 0;
        daoMaster = _daoMaster;
    }

    modifier onlyDAO() {
        require(msg.sender == daoMaster, "Unauthorized mint");
        _;
    }

    function mintNFT(address recipient, string memory tokenURI) external onlyDAO returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _mint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter++;
        return newTokenId;
    }
}
