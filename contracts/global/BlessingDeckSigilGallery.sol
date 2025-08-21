// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckSigilGallery {
    struct SigilDisplay {
        string steward;
        string region;
        string sigilURI;
        uint256 aprScore;
        uint256 blessingsReceived;
        uint256 scansTriggered;
        uint256 timestamp;
    }

    SigilDisplay[] public gallery;

    event SigilExhibited(string steward, string sigilURI);

    function exhibitSigil(
        string memory _steward,
        string memory _region,
        string memory _sigilURI,
        uint256 _aprScore,
        uint256 _blessingsReceived,
        uint256 _scansTriggered
    ) public {
        gallery.push(SigilDisplay({
            steward: _steward,
            region: _region,
            sigilURI: _sigilURI,
            aprScore: _aprScore,
            blessingsReceived: _blessingsReceived,
            scansTriggered: _scansTriggered,
            timestamp: block.timestamp
        }));

        emit SigilExhibited(_steward, _sigilURI);
    }

    function getGallery() public view returns (SigilDisplay[] memory) {
        return gallery;
    }
}
