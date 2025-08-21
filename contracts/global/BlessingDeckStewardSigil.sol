// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckStewardSigil {
    struct StewardSigil {
        string steward;
        uint256 aprScore;
        uint256 blessingsReceived;
        uint256 scansTriggered;
        string sigilHash;
        uint256 timestamp;
    }

    mapping(string => StewardSigil) public sigils;

    event SigilMinted(string steward, string sigilHash);

    function mintSigil(
        string memory _steward,
        uint256 _aprScore,
        uint256 _blessingsReceived,
        uint256 _scansTriggered
    ) public {
        string memory hash = generateSigilHash(_steward, _aprScore, _blessingsReceived, _scansTriggered);

        sigils[_steward] = StewardSigil({
            steward: _steward,
            aprScore: _aprScore,
            blessingsReceived: _blessingsReceived,
            scansTriggered: _scansTriggered,
            sigilHash: hash,
            timestamp: block.timestamp
        });

        emit SigilMinted(_steward, hash);
    }

    function generateSigilHash(
        string memory _steward,
        uint256 _apr,
        uint256 _blessings,
        uint256 _scans
    ) internal pure returns (string memory) {
        return string(abi.encodePacked(
            "SIGIL-", _steward, "-", uint2str(_apr), "-", uint2str(_blessings), "-", uint2str(_scans)
        ));
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i; uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len; j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10)); j /= 10;
        }
        return string(bstr);
    }

    function getSigil(string memory _steward) public view returns (StewardSigil memory) {
        return sigils[_steward];
    }
}
