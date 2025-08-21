// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckSurgeRelay {
    uint256 public surgeThreshold = 90;

    struct SurgeAlert {
        string region;
        uint256 predictedSurgeScore;
        string broadcastMessage;
        uint256 timestamp;
    }

    SurgeAlert[] public alerts;

    event SurgeBroadcastTriggered(string region, uint256 predictedSurgeScore, string broadcastMessage);

    function relaySurge(
        string memory _region,
        uint256 _predictedSurgeScore
    ) public {
        require(_predictedSurgeScore >= surgeThreshold, "Surge score below mythic threshold");

        string memory message = string(abi.encodePacked(
            "🚨 Surge Alert: ", _region,
            " predicted score: ", uint2str(_predictedSurgeScore),
            ". Blessing decks activated. Stewards prepare."
        ));

        alerts.push(SurgeAlert({
            region: _region,
            predictedSurgeScore: _predictedSurgeScore,
            broadcastMessage: message,
            timestamp: block.timestamp
        }));

        emit SurgeBroadcastTriggered(_region, _predictedSurgeScore, message);
    }

    function getAlerts() public view returns (SurgeAlert[] memory) {
        return alerts;
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
}
