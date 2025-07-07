// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollBeacon {
    function getAlert(uint256 id) external view returns (
        uint8 alertType,
        string memory message,
        address triggeredBy,
        uint256 timestamp
    );
    function totalAlerts() external view returns (uint256);
}

contract VinScrollSentinel {
    enum Response { None, SummonGuardians, ActivateShield, LockSanctum }

    struct Reaction {
        uint8 alertType;
        Response response;
        string ritualPhrase;
    }

    Reaction[] public reactions;
    IVinScrollBeacon public beacon;
    address public immutable sentinelMaster;

    event ResponseTriggered(uint256 indexed alertId, Response response, string ritualPhrase, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == sentinelMaster, "Not the sentinel master");
        _;
    }

    constructor(address beaconAddress) {
        beacon = IVinScrollBeacon(beaconAddress);
        sentinelMaster = msg.sender;
    }

    function defineReaction(uint8 alertType, Response response, string calldata ritualPhrase) external onlyMaster {
        reactions.push(Reaction({
            alertType: alertType,
            response: response,
            ritualPhrase: ritualPhrase
        }));
    }

    function reactToAlert(uint256 alertId) external {
        require(alertId < beacon.totalAlerts(), "Invalid alert ID");
        (uint8 alertType,,,) = beacon.getAlert(alertId);

        for (uint256 i = 0; i < reactions.length; i++) {
            if (reactions[i].alertType == alertType) {
                emit ResponseTriggered(alertId, reactions[i].response, reactions[i].ritualPhrase, block.timestamp);
                return;
            }
        }

        revert("No defined reaction for this alert");
    }

    function totalReactions() external view returns (uint256) {
        return reactions.length;
    }
}
