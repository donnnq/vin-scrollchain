// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckSigilMintStation {
    struct MintedSigil {
        string steward;
        string region;
        uint256 aprScore;
        uint256 blessingsReceived;
        uint256 scansTriggered;
        string sigilURI;
        uint256 timestamp;
    }

    MintedSigil[] public mintedSigils;

    event SigilMinted(string steward, string sigilURI);

    function mintSigil(
        string memory _steward,
        string memory _region,
        uint256 _aprScore,
        uint256 _blessingsReceived,
        uint256 _scansTriggered,
        string memory _sigilURI
    ) public {
        mintedSigils.push(MintedSigil({
            steward: _steward,
            region: _region,
            aprScore: _aprScore,
            blessingsReceived: _blessingsReceived,
            scansTriggered: _scansTriggered,
            sigilURI: _sigilURI,
            timestamp: block.timestamp
        }));

        emit SigilMinted(_steward, _sigilURI);
    }

    function getMintedSigils() public view returns (MintedSigil[] memory) {
        return mintedSigils;
    }
}
