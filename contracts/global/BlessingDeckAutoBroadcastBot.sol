// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckAutoBroadcastBot {
    struct AutoBlessing {
        string country;
        string partnerOrg;
        uint256 aprScore;
        string blessingType;
        string broadcastMessage;
        uint256 timestamp;
    }

    AutoBlessing[] public broadcasts;

    event BlessingAutoBroadcasted(string country, string partnerOrg, uint256 aprScore, string blessingType);

    function autoBroadcast(
        string memory _country,
        string memory _partnerOrg,
        uint256 _aprScore,
        string memory _blessingType
    ) public {
        require(_aprScore >= 90, "APR must be mythic to trigger auto-broadcast");

        string memory message = string(abi.encodePacked(
            "📡 Blessing activated for ", _partnerOrg, " in ", _country,
            ". Emotional APR: ", uint2str(_aprScore),
            ". Type: ", _blessingType,
            ". Steward resonance confirmed."
        ));

        broadcasts.push(AutoBlessing({
            country: _country,
            partnerOrg: _partnerOrg,
            aprScore: _aprScore,
            blessingType: _blessingType,
            broadcastMessage: message,
            timestamp: block.timestamp
        }));

        emit BlessingAutoBroadcasted(_country, _partnerOrg, _aprScore, _blessingType);
    }

    function getBroadcasts() public view returns (AutoBlessing[] memory) {
        return broadcasts;
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        return string(bstr);
    }
}
