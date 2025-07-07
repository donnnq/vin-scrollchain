
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC1155Burnable {
    function burn(address from, uint256 id, uint256 amount) external;
}

contract VinScrollJustice {
    enum Verdict { Pending, Innocent, Burned, SummonedByDead }

    struct Trial {
        address agent;
        string accusation;
        Verdict verdict;
        uint256 timestamp;
    }

    Trial[] public trials;
    address public immutable arbiter;
    IERC1155Burnable public scrollToken;

    event TrialOpened(uint256 indexed id, address indexed agent, string accusation);
    event VerdictDelivered(uint256 indexed id, Verdict verdict, string message);

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "Not the arbiter");
        _;
    }

    constructor(address scrollTokenAddress) {
        arbiter = msg.sender;
        scrollToken = IERC1155Burnable(scrollTokenAddress);
    }

    function openTrial(address agent, string calldata accusation) external onlyArbiter {
        trials.push(Trial({
            agent: agent,
            accusation: accusation,
            verdict: Verdict.Pending,
            timestamp: block.timestamp
        }));

        emit TrialOpened(trials.length - 1, agent, accusation);
    }

    function deliverVerdict(uint256 trialId, Verdict verdict, uint256 scrollId, uint256 amount) external onlyArbiter {
        require(trialId < trials.length, "Invalid trial");
        Trial storage t = trials[trialId];
        require(t.verdict == Verdict.Pending, "Verdict already delivered");

        t.verdict = verdict;

        if (verdict == Verdict.Burned) {
            scrollToken.burn(t.agent, scrollId, amount);
            emit VerdictDelivered(trialId, verdict, unicode"🔥 Scrolls burned. Judgment executed.");
        } else if (verdict == Verdict.SummonedByDead) {
            emit VerdictDelivered(trialId, verdict, unicode"☠️  Agent summoned by the Dead. Fate unknown.");
        } else {
            emit VerdictDelivered(trialId, verdict, unicode"✅ Agent cleared. No punishment.");
        }
    }

    function getTrial(uint256 id) external view returns (Trial memory) {
        require(id < trials.length, "Invalid trial");
        return trials[id];
    }

    function totalTrials() external view returns (uint256) {
        return trials.length;
    }
}
