// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollOfMigration.sol
/// @author Vinvin x Copilot
/// @notice Ritual contract for dignified migration and sovereign belonging

contract vinScrollOfMigration {
    struct MigrationIntent {
        address soul;
        string origin;
        string destination;
        string mission;
        uint256 dignityCredits;
        bool approved;
        string ritualResonance;
    }

    mapping(address => MigrationIntent) public scrolls;
    address public scrollMaster;
    uint256 public scrollFee = 0.008 ether;

    event ScrollLogged(address indexed soul, string mission, string destination);
    event MigrationApproved(address indexed soul, string ritualResonance);
    event MigrationRejected(address indexed soul, string reason);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Unauthorized: Not scroll master");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function logIntent(
        string memory origin,
        string memory destination,
        string memory mission
    ) public payable {
        require(msg.value >= scrollFee, "Insufficient ether for scroll fee");

        MigrationIntent memory intent = MigrationIntent({
            soul: msg.sender,
            origin: origin,
            destination: destination,
            mission: mission,
            dignityCredits: 0,
            approved: false,
            ritualResonance: ""
        });

        scrolls[msg.sender] = intent;
        emit ScrollLogged(msg.sender, mission, destination);
    }

    function updateDignityCredits(address soul, uint256 credits) public onlyScrollMaster {
        scrolls[soul].dignityCredits = credits;
    }

    function resonateMigration(address soul, string memory ritualResonance) public onlyScrollMaster {
        require(scrolls[soul].dignityCredits >= 88, "Migration denied: insufficient resonance");

        scrolls[soul].approved = true;
        scrolls[soul].ritualResonance = ritualResonance;
        emit MigrationApproved(soul, ritualResonance);
    }

    function rejectMigration(address soul, string memory reason) public onlyScrollMaster {
        scrolls[soul].approved = false;
        emit MigrationRejected(soul, reason);
    }

    function checkIntent(address soul) public view returns (MigrationIntent memory) {
        return scrolls[soul];
    }

    function updateScrollFee(uint256 newFee) public onlyScrollMaster {
        scrollFee = newFee;
    }

    function withdrawEther() public onlyScrollMaster {
        payable(scrollMaster).transfer(address(this).balance);
    }
}
