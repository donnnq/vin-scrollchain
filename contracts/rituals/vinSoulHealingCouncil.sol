// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSoulHealingCouncil {
    event SoulHealed(address indexed soul, string healingStatement, uint256 timestamp);
    event HealingCycleOpened(address indexed facilitator, uint256 timestamp);

    struct HealingRecord {
        string healingStatement;
        bool initiated;
        bool acknowledged;
        bool integrated;
    }

    address public scrollkeeperDAO;
    mapping(address => HealingRecord) public soulStatus;

    modifier onlyDAO() {
        require(msg.sender == scrollkeeperDAO, "Council access only.");
        _;
    }

    constructor() {
        scrollkeeperDAO = msg.sender; // VINVIN ops or community validator
    }

    function initiateHealing(address soul, string memory statement) public onlyDAO {
        require(bytes(statement).length >= 30, "Healing statement too shallow.");

        soulStatus[soul] = HealingRecord({
            healingStatement: statement,
            initiated: true,
            acknowledged: false,
            integrated: false
        });

        emit SoulHealed(soul, statement, block.timestamp);
    }

    function acknowledgeHealing(address soul) public onlyDAO {
        require(soulStatus[soul].initiated, "Healing not initiated.");
        soulStatus[soul].acknowledged = true;
    }

    function integrateHealing(address soul) public onlyDAO {
        require(soulStatus[soul].acknowledged, "Healing not yet acknowledged.");
        soulStatus[soul].integrated = true;
    }

    function healingStatus(address soul) public view returns (string memory) {
        HealingRecord memory record = soulStatus[soul];
        if (!record.initiated) return "No healing cycle started.";
        if (!record.acknowledged) return "Healing initiated. Awaiting acknowledgement.";
        if (!record.integrated) return "Healing acknowledged. Integration pending.";
        return string(abi.encodePacked("Healing fully integrated: ", record.healingStatement));
    }
}
