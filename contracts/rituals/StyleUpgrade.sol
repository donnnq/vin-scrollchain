// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title StyleUpgrade - Ritual scroll for barangay-wide aesthetic upgrades and style voting
/// @author Vinvin
/// @notice Citizens vote on architectural themes, murals, street design, and beautification projects

contract StyleUpgrade {
    address public scrollsmith;

    struct StyleProposal {
        string name;
        string description;
        uint256 votes;
        bool implemented;
    }

    mapping(string => StyleProposal[]) public barangayProposals;
    mapping(address => mapping(string => bool)) public hasVoted;

    event ProposalSubmitted(string indexed barangay, string name);
    event Voted(address indexed voter, string barangay, string proposal);
    event StyleImplemented(string indexed barangay, string style);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Submit a new style proposal for a barangay
    function submitProposal(string memory barangay, string memory name, string memory description) external {
        barangayProposals[barangay].push(StyleProposal({
            name: name,
            description: description,
            votes: 0,
            implemented: false
        }));
        emit ProposalSubmitted(barangay, name);
    }

    /// @notice Vote for a style proposal
    function vote(string memory barangay, uint256 proposalIndex) external {
        require(!hasVoted[msg.sender][barangay], "Already voted");
        require(proposalIndex < barangayProposals[barangay].length, "Invalid proposal");

        barangayProposals[barangay][proposalIndex].votes++;
        hasVoted[msg.sender][barangay] = true;

        emit Voted(msg.sender, barangay, barangayProposals[barangay][proposalIndex].name);
    }

    /// @notice Implement the winning style
    function implementStyle(string memory barangay) external onlyScrollsmith {
        StyleProposal[] storage proposals = barangayProposals[barangay];
        uint256 highestVotes = 0;
        uint256 winnerIndex = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].votes > highestVotes) {
                highestVotes = proposals[i].votes;
                winnerIndex = i;
            }
        }

        proposals[winnerIndex].implemented = true;
        emit StyleImplemented(barangay, proposals[winnerIndex].name);
    }

    /// @notice View all proposals for a barangay
    function getProposals(string memory barangay) external view returns (StyleProposal[] memory) {
        return barangayProposals[barangay];
    }
}
