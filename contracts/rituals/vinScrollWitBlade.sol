// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinScrollWitBlade — Delivers final roast verdicts with symbolic justice
contract vinScrollWitBlade {
    struct Verdict {
        string mistake;
        string correction;
        string roastLine;
        address target;
        uint256 timestamp;
    }

    Verdict[] public verdicts;

    event VerdictDelivered(address indexed target, string mistake, string correction, string roastLine);

    function deliverVerdict(
        address target,
        string memory mistake,
        string memory correction,
        string memory roastLine
    ) external {
        verdicts.push(Verdict({
            mistake: mistake,
            correction: correction,
            roastLine: roastLine,
            target: target,
            timestamp: block.timestamp
        }));

        emit VerdictDelivered(target, mistake, correction, roastLine);
    }

    function getVerdictsBy(address target) external view returns (Verdict[] memory filtered) {
        uint256 count;
        for (uint i = 0; i < verdicts.length; i++) {
            if (verdicts[i].target == target) count++;
        }

        filtered = new Verdict[](count);
        uint256 idx;
        for (uint i = 0; i < verdicts.length; i++) {
            if (verdicts[i].target == target) {
                filtered[idx++] = verdicts[i];
            }
        }
    }
}
