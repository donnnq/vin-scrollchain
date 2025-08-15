// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface ILegalVowNFT {
    function getTokenId(string memory caseId) external view returns (uint256);
}

contract NFTBlessing {
    address public steward;
    ILegalVowNFT public nftContract;

    struct Blessing {
        uint256 tokenId;
        string caseId;
        uint256 emotionalAPR;
        string blessingNote;
        uint256 timestamp;
    }

    mapping(uint256 => Blessing) public blessings;
    uint256[] public blessedTokens;

    event BlessingDropped(uint256 indexed tokenId, string caseId, uint256 emotionalAPR, string note);

    constructor(address _nftContract) {
        steward = msg.sender;
        nftContract = ILegalVowNFT(_nftContract);
    }

    function dropBlessing(string memory caseId, uint256 apr, string memory note) public {
        require(msg.sender == steward, "Only steward can bless");

        uint256 tokenId = nftContract.getTokenId(caseId);
        require(blessings[tokenId].tokenId == 0, "Already blessed");

        Blessing memory b = Blessing({
            tokenId: tokenId,
            caseId: caseId,
            emotionalAPR: apr,
            blessingNote: note,
            timestamp: block.timestamp
        });

        blessings[tokenId] = b;
        blessedTokens.push(tokenId);

        emit BlessingDropped(tokenId, caseId, apr, note);
    }

    function getBlessing(uint256 tokenId) public view returns (Blessing memory) {
        return blessings[tokenId];
    }

    function getBlessedTokens() public view returns (uint256[] memory) {
        return blessedTokens;
    }
}
