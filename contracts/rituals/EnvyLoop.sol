// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EnvyLoop - Ritual module that converts envy into civic upgrade proposals
/// @author Vinvin
/// @notice Listens for low joy scores or matampuhin feedback and triggers ScrollVote proposals

interface IScrollVote {
    function createProposal(
        string calldata title,
        string calldata description,
        uint256 durationInSeconds
    ) external;
}

interface ISoulAudit {
    function getLatestAudit(string calldata barangay) external view returns (
        uint256 joyTotal,
        uint256 dignityTotal,
        uint256 impactTotal,
        uint256 structureCount,
        string memory summary,
        uint256 timestamp
    );
}

contract EnvyLoop {
    address public scrollsmith;
    IScrollVote public scrollVote;
    ISoulAudit public soulAudit;

    uint256 public joyThreshold = 50;
    uint256 public cooldown = 1 days;
    mapping(string => uint256) public lastTriggered;

    event EnvyDetected(string indexed barangay, uint256 joyScore, string summary);
    event ProposalAutoCreated(string indexed barangay, string title);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor(address _scrollVote, address _soulAudit) {
        scrollsmith = msg.sender;
        scrollVote = IScrollVote(_scrollVote);
        soulAudit = ISoulAudit(_soulAudit);
    }

    /// @notice Check audit and trigger proposal if joy is below threshold
    function checkAndTrigger(string calldata barangay) external {
        (
            uint256 joyTotal,
            ,
            ,
            ,
            string memory summary,

        ) = soulAudit.getLatestAudit(barangay);

        require(block.timestamp > lastTriggered[barangay] + cooldown, "Cooldown active");

        if (joyTotal < joyThreshold) {
            emit EnvyDetected(barangay, joyTotal, summary);

            string memory title = string(abi.encodePacked("Upgrade Public Services: ", barangay));
            string memory description = string(abi.encodePacked(
                "Joy score below threshold. Citizens feel matampuhin. Summary: ", summary
            ));

            scrollVote.createProposal(title, description, 3 days);
            lastTriggered[barangay] = block.timestamp;

            emit ProposalAutoCreated(barangay, title);
        }
    }

    /// @notice Update joy threshold
    function setJoyThreshold(uint256 newThreshold) external onlyScrollsmith {
        joyThreshold = newThreshold;
    }

    /// @notice Update cooldown period
    function setCooldown(uint256 newCooldown) external onlyScrollsmith {
        cooldown = newCooldown;
    }
}
