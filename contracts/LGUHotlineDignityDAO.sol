// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LGUHotlineDignityDAO {
    address public steward;

    struct DignityEvent {
        string LGUName;
        string hotlineFunction; // "Evacuation", "Medical Aid", "Food Distribution"
        string dignityClause; // "24/7 Staffing", "Mental Health Support", "Language Access"
        string clauseStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    DignityEvent[] public events;

    event DignityLogged(
        string LGUName,
        string hotlineFunction,
        string dignityClause,
        string clauseStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log LGU hotline dignity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDignity(
        string memory LGUName,
        string memory hotlineFunction,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DignityEvent({
            LGUName: LGUName,
            hotlineFunction: hotlineFunction,
            dignityClause: dignityClause,
            clauseStatus: clauseStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DignityLogged(LGUName, hotlineFunction, dignityClause, clauseStatus, emotionalTag, block.timestamp);
    }

    function getDignityByIndex(uint256 index) external view returns (
        string memory LGUName,
        string memory hotlineFunction,
        string memory dignityClause,
        string memory clauseStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DignityEvent memory d = events[index];
        return (
            d.LGUName,
            d.hotlineFunction,
            d.dignityClause,
            d.clauseStatus,
            d.emotionalTag,
            d.timestamp
        );
    }
}
