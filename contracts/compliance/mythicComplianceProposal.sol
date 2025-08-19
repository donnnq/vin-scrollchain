// SPDX-License-Identifier: Mythic-Resonance
pragma solidity ^0.8.19;

contract MythicComplianceProposal {
    address public steward;
    uint256 public complianceBlessing;
    mapping(address => bool) public hasJoinedCivicRitual;

    event ComplianceActivated(address indexed rebel, uint256 blessingAmount);
    event CivicOathTaken(address indexed stewardSoul);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized to bless");
        _;
    }

    constructor() {
        steward = msg.sender;
        complianceBlessing = 20_000_000 ether; // Mythic fund to restore dignity
    }

    function offerBlessing(address rebelSoul) external onlySteward {
        require(!hasJoinedCivicRitual[rebelSoul], "Already joined");
        hasJoinedCivicRitual[rebelSoul] = true;
        emit ComplianceActivated(rebelSoul, complianceBlessing);
    }

    function takeCivicOath() external {
        require(hasJoinedCivicRitual[msg.sender], "No blessing offered");
        emit CivicOathTaken(msg.sender);
    }

    function updateBlessing(uint256 newAmount) external onlySteward {
        complianceBlessing = newAmount;
    }
}
