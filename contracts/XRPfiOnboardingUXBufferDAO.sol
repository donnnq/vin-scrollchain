// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract XRPfiOnboardingUXBufferDAO {
    address public steward;

    struct UXEvent {
        string userType; // "Retail", "Institutional", "Developer"
        string frictionPoint; // "Trustline Setup", "Wallet Confusion", "Vault Access"
        string bufferAction; // "Tutorial", "Auto-Trustline", "UX Patch"
        string emotionalTag;
        uint256 timestamp;
    }

    UXEvent[] public events;

    event UXLogged(
        string userType,
        string frictionPoint,
        string bufferAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log XRPfi onboarding rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logUX(
        string memory userType,
        string memory frictionPoint,
        string memory bufferAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(UXEvent({
            userType: userType,
            frictionPoint: frictionPoint,
            bufferAction: bufferAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit UXLogged(userType, frictionPoint, bufferAction, emotionalTag, block.timestamp);
    }

    function getUXByIndex(uint256 index) external view returns (
        string memory userType,
        string memory frictionPoint,
        string memory bufferAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        UXEvent memory u = events[index];
        return (
            u.userType,
            u.frictionPoint,
            u.bufferAction,
            u.emotionalTag,
            u.timestamp
        );
    }
}
