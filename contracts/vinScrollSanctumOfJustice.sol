contract vinScrollSanctumOfJustice {
    struct Case {
        uint256 id;
        string issue;
        address accused;
        uint256 voteY;
        uint256 voteN;
        bool resolved;
    }

    mapping(uint256 => Case) public trials;
    event JudgmentCasted(uint256 indexed caseId, bool outcome);

    function openCase(uint256 id, string memory issue, address accused) public {
        trials[id] = Case(id, issue, accused, 0, 0, false);
    }

    function vote(uint256 caseId, bool support, uint256 auraWeight) public {
        Case storage c = trials[caseId];
        require(!c.resolved, "Already judged");
        if (support) c.voteY += auraWeight;
        else c.voteN += auraWeight;

        if (c.voteY + c.voteN >= 100) {
            c.resolved = true;
            emit JudgmentCasted(caseId, c.voteY > c.voteN);
        }
    }
}
