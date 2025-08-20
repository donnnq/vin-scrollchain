// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract WitnessReward {
    address public steward;
    uint256 public rewardAmount = 1_000_000;

    struct Witness {
        address witnessAddress;
        string testimonyHash;
        bool verified;
        bool rewarded;
    }

    mapping(uint256 => Witness) public witnesses;
    uint256 public witnessCount;

    event TestimonySubmitted(uint256 witnessId, address witness);
    event RewardReleased(uint256 witnessId, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can act");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function submitTestimony(string memory _testimonyHash) public {
        witnesses[witnessCount] = Witness(msg.sender, _testimonyHash, false, false);
        emit TestimonySubmitted(witnessCount, msg.sender);
        witnessCount++;
    }

    function verifyTestimony(uint256 _witnessId) public onlySteward {
        witnesses[_witnessId].verified = true;
    }

    function releaseReward(uint256 _witnessId) public onlySteward {
        Witness storage w = witnesses[_witnessId];
        require(w.verified, "Testimony not verified");
        require(!w.rewarded, "Already rewarded");

        w.rewarded = true;
        emit RewardReleased(_witnessId, rewardAmount);
        // Transfer logic to be integrated with treasury
    }
}
