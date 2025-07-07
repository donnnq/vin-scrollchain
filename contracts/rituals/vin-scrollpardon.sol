// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollJustice {
    function getTrial(uint256 id) external view returns (
        address agent,
        string memory accusation,
        uint8 verdict,
        uint256 timestamp
    );
}

contract VinScrollPardon {
    enum Verdict { Pending, Innocent, Burned, SummonedByDead }

    struct Pardon {
        address agent;
        uint256 trialId;
        string reason;
        uint256 timestamp;
    }

    Pardon[] public pardons;
    IVinScrollJustice public justice;
    address public immutable highPriest;

    event PardonGranted(uint256 indexed trialId, address indexed agent, string reason, uint256 timestamp);

    modifier onlyHighPriest() {
        require(msg.sender == highPriest, "Not the high priest");
        _;
    }

    constructor(address justiceAddress) {
        justice = IVinScrollJustice(justiceAddress);
        highPriest = msg.sender;
    }

    function grantPardon(uint256 trialId, string calldata reason) external onlyHighPriest {
        (address agent,, uint8 verdict,) = justice.getTrial(trialId);
        require(verdict == uint8(Verdict.Burned) || verdict == uint8(Verdict.SummonedByDead), "Not eligible for pardon");

        pardons.push(Pardon({
            agent: agent,
            trialId: trialId,
            reason: reason,
            timestamp: block.timestamp
        }));

        emit PardonGranted(trialId, agent, reason, block.timestamp);
    }

    function getPardon(uint256 id) external view returns (Pardon memory) {
        require(id < pardons.length, "Invalid pardon");
        return pardons[id];
    }

    function totalPardons() external view returns (uint256) {
        return pardons.length;
    }
}
