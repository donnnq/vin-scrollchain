// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPfiOnboardingCharterDAO {
    address public steward;

    struct CharterEvent {
        string userType; // "Retail", "Institutional", "Developer"
        string onboardingBarrier; // "Trustline Setup", "Wallet Absence", "Vault Confusion"
        string treatyClause; // "Auto-Trustline", "UX Patch", "Wallet Integration"
        string emotionalTag;
        uint256 timestamp;
    }

    CharterEvent[] public events;

    event CharterLogged(
        string userType,
        string onboardingBarrier,
        string treatyClause,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log XRPfi onboarding treaties");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCharter(
        string memory userType,
        string memory onboardingBarrier,
        string memory treatyClause,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CharterEvent({
            userType: userType,
            onboardingBarrier: onboardingBarrier,
            treatyClause: treatyClause,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CharterLogged(userType, onboardingBarrier, treatyClause, emotionalTag, block.timestamp);
    }

    function getCharterByIndex(uint256 index) external view returns (
        string memory userType,
        string memory onboardingBarrier,
        string memory treatyClause,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CharterEvent memory c = events[index];
        return (
            c.userType,
            c.onboardingBarrier,
            c.treatyClause,
            c.emotionalTag,
            c.timestamp
        );
    }
}
