// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinFoodSovereigntyDAO {
    struct FarmerProposal {
        address proposer;
        string proposalType; // e.g. "Import Freeze", "Price Alert", "NFA Restoration"
        string region;
        string description;
        uint timestamp;
        uint votesFor;
        uint votesAgainst;
        bool executed;
    }

    mapping(uint => FarmerProposal) public proposals;
    uint public proposalCount;
    mapping(address => bool) public registeredFarmers;

    event ProposalCreated(uint indexed id, address indexed proposer, string proposalType);
    event ProposalVoted(uint indexed id, address indexed voter, bool support);
    event ProposalExecuted(uint indexed id, string result);

    modifier onlyFarmer() {
        require(registeredFarmers[msg.sender], "Not registered as farmer");
        _;
    }

    function registerFarmer(address _farmer) external {
        registeredFarmers[_farmer] = true;
    }

    function submitProposal(string memory _type, string memory _region, string memory _desc) external onlyFarmer {
        proposals[proposalCount] = FarmerProposal({
            proposer: msg.sender,
            proposalType: _type,
            region: _region,
            description: _desc,
            timestamp: block.timestamp,
            votesFor: 0,
            votesAgainst: 0,
            executed: false
        });

        emit ProposalCreated(proposalCount, msg.sender, _type);
        proposalCount++;
    }

    function voteOnProposal(uint _id, bool _support) external onlyFarmer {
        FarmerProposal storage prop = proposals[_id];
        require(!prop.executed, "Already executed");

        if (_support) {
            prop.votesFor++;
        } else {
            prop.votesAgainst++;
        }

        emit ProposalVoted(_id, msg.sender, _support);
    }

    function executeProposal(uint _id) external {
        FarmerProposal storage prop = proposals[_id];
        require(!prop.executed, "Already executed");

        if (prop.votesFor > prop.votesAgainst) {
            prop.executed = true;
            emit ProposalExecuted(_id, "Approved");
        } else {
            prop.executed = true;
            emit ProposalExecuted(_id, "Rejected");
        }
    }
}
