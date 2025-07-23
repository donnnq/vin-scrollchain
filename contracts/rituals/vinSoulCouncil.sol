// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSoulCouncil {
    event CouncilAdmission(address indexed soul, string publicStatement, uint256 timestamp);
    event CouncilForgiveness(address indexed soul, bool granted, string remarks, uint256 timestamp);

    struct SoulEntry {
        string statement;
        bool admitted;
        bool reviewed;
        bool grantedForgiveness;
        string remarks;
    }

    address public scrollkeeperDAO;
    mapping(address => SoulEntry) public entries;
    mapping(address => bool) public flaggedForRepeatBehavior;

    modifier onlyDAO() {
        require(msg.sender == scrollkeeperDAO, "Council access denied.");
        _;
    }

    constructor() {
        scrollkeeperDAO = msg.sender; // VINVIN or trusted council initiator
    }

    function admitSoul(address soul, string memory statement) public onlyDAO {
        require(bytes(statement).length >= 20, "Statement too short.");

        entries[soul].statement = statement;
        entries[soul].admitted = true;
        entries[soul].reviewed = false;
        entries[soul].grantedForgiveness = false;

        emit CouncilAdmission(soul, statement, block.timestamp);
    }

    function reviewSoul(address soul, bool approveForgiveness, string memory remarks) public onlyDAO {
        require(entries[soul].admitted, "Soul not admitted yet.");
        entries[soul].reviewed = true;
        entries[soul].grantedForgiveness = approveForgiveness;
        entries[soul].remarks = remarks;

        if (!approveForgiveness) {
            flaggedForRepeatBehavior[soul] = true;
        }

        emit CouncilForgiveness(soul, approveForgiveness, remarks, block.timestamp);
    }

    function getForgivenessStatus(address soul) public view returns (string memory) {
        SoulEntry memory entry = entries[soul];
        if (!entry.admitted) return "Soul not yet admitted to VINVIN Council.";
        if (!entry.reviewed) return "Awaiting Council deliberation.";
        if (entry.grantedForgiveness && !flaggedForRepeatBehavior[soul]) {
            return "Forgiveness granted by VINVIN SoulCouncil.";
        } else if (flaggedForRepeatBehavior[soul]) {
            return "Behavior flagged as repetitive. Entry restricted.";
        } else {
            return "Forgiveness declined by Council.";
        }
    }
}
