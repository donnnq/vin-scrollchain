contract vinQuickVote {
    struct Proposal {
        string title;
        uint256 yay;
        uint256 nay;
        bool executed;
    }

    Proposal[] public proposals;

    event Voted(uint256 indexed proposalId, bool vote);
    event ProposalCreated(uint256 indexed proposalId, string title);
    event ProposalExecuted(uint256 indexed proposalId);

    function createProposal(string memory title) public {
        proposals.push(Proposal(title, 0, 0, false));
        emit ProposalCreated(proposals.length - 1, title);
    }

    function vote(uint256 proposalId, bool support) public {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");

        if (support) p.yay++;
        else p.nay++;

        emit Voted(proposalId, support);
    }

    function execute(uint256 proposalId) public {
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        require(p.yay > p.nay, "Rejected by vote");

        p.executed = true;
        emit ProposalExecuted(proposalId);
    }
}
