// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IDueProcessVault {
    function getVow(string memory caseId) external view returns (
        string memory caseId,
        string memory jurisdiction,
        string memory vowText,
        uint256 timestamp
    );
}

contract LegalVowNFT is ERC721URIStorage, Ownable {
    IDueProcessVault public vaultContract;
    uint256 public tokenCounter;

    mapping(string => bool) public minted;
    mapping(string => uint256) public caseToToken;

    event VowMinted(string indexed caseId, uint256 tokenId, string jurisdiction);

    constructor(address _vaultContract) ERC721("LegalVowBadge", "LVB") {
        vaultContract = IDueProcessVault(_vaultContract);
        tokenCounter = 1;
    }

    function mintVowBadge(string memory caseId, string memory tokenURI) public onlyOwner {
        require(!minted[caseId], "Badge already minted");

        (
            ,
            string memory jurisdiction,
            string memory vowText,
            uint256 timestamp
        ) = vaultContract.getVow(caseId);

        uint256 newTokenId = tokenCounter;
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        minted[caseId] = true;
        caseToToken[caseId] = newTokenId;
        tokenCounter++;

        emit VowMinted(caseId, newTokenId, jurisdiction);
    }

    function getTokenId(string memory caseId) public view returns (uint256) {
        return caseToToken[caseId];
    }
}
