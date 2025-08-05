// SPDX-License-Identifier: TRIAL-MIRROR-DAO
pragma solidity ^0.8.19;

contract vinTrialMirrorDAO {
    struct Signal {
        uint trialId;
        string message;
        uint weight;
        address citizen;
    }

    struct Proposal {
        string scrollChange;
        uint votesFor;
        uint votesAgainst;
        bool resolved;
    }

    Signal[] public signals;
    Proposal[] public proposals;

    mapping(address => bool) public isCitizen;
    address public daoAdmin;

    event SignalCast(uint trialId, string message, uint weight, address citizen);
    event ProposalFiled(string change);
    event ProposalVoted(uint index, bool inFavor, address voter);

    modifier onlyCitizen() {
        require(isCitizen[msg.sender], "Not authorized");
        _;
    }

    constructor() {
        daoAdmin = msg.sender;
    }

    function registerCitizen(address addr) external {
        require(msg.sender == daoAdmin, "Admin only");
        isCitizen[addr] = true;
    }

    function castSignal(uint trialId, string calldata msgContent, uint weight) external onlyCitizen {
        signals.push(Signal(trialId, msgContent, weight, msg.sender));
        emit SignalCast(trialId, msgContent, weight, msg.sender);
    }

    function fileProposal(string calldata scrollChange) external onlyCitizen {
        proposals.push(Proposal(scrollChange, 0, 0, false));
        emit ProposalFiled(scrollChange);
    }

    function voteProposal(uint index, bool support) external onlyCitizen {
        Proposal storage p = proposals[index];
        require(!p.resolved, "Proposal closed");

        if (support) p.votesFor++;
        else p.votesAgainst++;

        emit ProposalVoted(index, support, msg.sender);

        if (p.votesFor + p.votesAgainst >= 10) {
            p.resolved = true;
        }
    }

    function getProposal(uint index) external view returns (Proposal memory) {
        return proposals[index];
    }
}
