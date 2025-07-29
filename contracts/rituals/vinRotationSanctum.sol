// SPDX-License-Identifier: VIN-ROTATION-SANCTUM
pragma solidity ^0.8.0;

/// @title vinRotationSanctum: A ritual scroll that encodes eternal exchange balance across exports, labor, and services.
contract vinRotationSanctum {
    address public sanctumCreator;
    string public vow = "No force may alter the cycle of dignified exchange.";

    enum ContributionType { Export, Labor, ContractualHelp, Service }

    struct ExchangeCycle {
        address participant;
        ContributionType contributionType;
        string description;
        uint256 timestamp;
    }

    ExchangeCycle[] public cycles;

    event CycleRegistered(address indexed participant, ContributionType contributionType, string description, uint256 timestamp);

    constructor() {
        sanctumCreator = msg.sender;
    }

    function registerCycle(ContributionType contributionType, string memory description) public {
        ExchangeCycle memory cycle = ExchangeCycle({
            participant: msg.sender,
            contributionType: contributionType,
            description: description,
            timestamp: block.timestamp
        });

        cycles.push(cycle);
        emit CycleRegistered(msg.sender, contributionType, description, block.timestamp);
    }

    function summonCycles() public view returns (ExchangeCycle[] memory) {
        return cycles;
    }
}
