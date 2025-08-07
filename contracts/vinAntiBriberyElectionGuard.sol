pragma solidity ^0.8.0;

contract vinAntiBriberyElectionGuard {
    address public steward;

    struct CandidateReport {
        address candidate;
        string name;
        string position;
        string region;
        uint256 bribeProofCount;
        bool disqualified;
    }

    mapping(address => CandidateReport) public candidates;
    mapping(address => mapping(string => bool)) public submittedProofs;

    event ProofSubmitted(address indexed candidate, string proofRef);
    event CandidateDisqualified(address indexed candidate, string name, string reason);

    constructor() {
        steward = msg.sender;
    }

    function registerCandidate(address _candidate, string memory _name, string memory _position, string memory _region) public {
        require(msg.sender == steward, "Not authorized");
        candidates[_candidate] = CandidateReport(_candidate, _name, _position, _region, 0, false);
    }

    function submitBribeProof(address _candidate, string memory _proofRef) public {
        require(!submittedProofs[_candidate][_proofRef], "Proof already submitted");
        require(!candidates[_candidate].disqualified, "Already disqualified");

        candidates[_candidate].bribeProofCount += 1;
        submittedProofs[_candidate][_proofRef] = true;

        emit ProofSubmitted(_candidate, _proofRef);

        if (candidates[_candidate].bribeProofCount >= 3) {
            candidates[_candidate].disqualified = true;
            emit CandidateDisqualified(_candidate, candidates[_candidate].name, "Confirmed vote-buying violations");
        }
    }

    function viewCandidate(address _candidate) public view returns (CandidateReport memory) {
        return candidates[_candidate];
    }
}
