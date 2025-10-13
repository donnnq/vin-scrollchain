// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MedicalAidWageRestorationCharterDAO {
    address public steward;

    struct RestorationEvent {
        string hospitalName;
        string frontlineGroup; // "Nurses", "Doctors", "Barangay Health Workers"
        uint256 wageRestored;
        string restorationTrigger; // "Delayed Disbursement", "Budget Cut", "Crisis Surge"
        string emotionalTag;
        uint256 timestamp;
    }

    RestorationEvent[] public events;

    event RestorationLogged(
        string hospitalName,
        string frontlineGroup,
        uint256 wageRestored,
        string restorationTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log medical wage restoration rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRestoration(
        string memory hospitalName,
        string memory frontlineGroup,
        uint256 wageRestored,
        string memory restorationTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RestorationEvent({
            hospitalName: hospitalName,
            frontlineGroup: frontlineGroup,
            wageRestored: wageRestored,
            restorationTrigger: restorationTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RestorationLogged(hospitalName, frontlineGroup, wageRestored, restorationTrigger, emotionalTag, block.timestamp);
    }

    function getRestorationByIndex(uint256 index) external view returns (
        string memory hospitalName,
        string memory frontlineGroup,
        uint256 wageRestored,
        string memory restorationTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RestorationEvent memory r = events[index];
        return (
            r.hospitalName,
            r.frontlineGroup,
            r.wageRestored,
            r.restorationTrigger,
            r.emotionalTag,
            r.timestamp
        );
    }
}
