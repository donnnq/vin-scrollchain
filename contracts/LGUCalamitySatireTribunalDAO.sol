// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LGUCalamitySatireTribunalDAO {
    address public steward;

    struct TribunalEvent {
        string LGUName;
        string calamityType; // "Flood", "Fire", "Earthquake"
        string satireType; // "Mock Alert", "Animated Thread", "Parody PSA"
        string verdict; // "Flagged", "Amplified", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    TribunalEvent[] public events;

    event TribunalLogged(
        string LGUName,
        string calamityType,
        string satireType,
        string verdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log LGU calamity satire trials");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTribunal(
        string memory LGUName,
        string memory calamityType,
        string memory satireType,
        string memory verdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TribunalEvent({
            LGUName: LGUName,
            calamityType: calamityType,
            satireType: satireType,
            verdict: verdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TribunalLogged(LGUName, calamityType, satireType, verdict, emotionalTag, block.timestamp);
    }

    function getTribunalByIndex(uint256 index) external view returns (
        string memory LGUName,
        string memory calamityType,
        string memory satireType,
        string memory verdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TribunalEvent memory t = events[index];
        return (
            t.LGUName,
            t.calamityType,
            t.satireType,
            t.verdict,
            t.emotionalTag,
            t.timestamp
        );
    }
}
