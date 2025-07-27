contract vinScrollCouncilMirror {
    struct Proposal {
        string title;
        string description;
        uint256 voteYes;
        uint256 voteNo;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(uint => mapping(address => bool)) public hasVoted;

    function createProposal(string calldata title, string calldata description) external {
        proposals.push(Proposal(title, description, 0, 0, false));
    }

    function vote(uint proposalId, bool support) external {
        require(!hasVoted[proposalId][msg.sender], "Already voted");
        Proposal storage prop = proposals[proposalId];
        if (support) prop.voteYes++;
        else prop.voteNo++;
        hasVoted[proposalId][msg.sender] = true;
    }

    function executeProposal(uint proposalId) external {
        Proposal storage prop = proposals[proposalId];
        require(!prop.executed, "Already executed");
        prop.executed = true;
        // Logic can be expanded per scrollchain governance
    }
}
