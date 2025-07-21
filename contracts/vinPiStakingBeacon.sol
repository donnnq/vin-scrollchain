// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinPiStakingBeacon {
    struct Stake {
        address staker;
        uint256 amount;
        uint256 timestamp;
        bool active;
    }

    mapping(address => Stake) public stakers;
    address public scrollkeeper;
    uint256 public totalStaked;
    uint256 public rewardRate = 88; // symbolic kilig-tier multiplier

    event BeaconStaked(address indexed staker, uint256 amount, uint256 when);
    event BeaconUnstaked(address indexed staker, uint256 amount, uint256 when);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function stakePi(uint256 _amount) public {
        require(_amount > 0, "Walang kilig kung walang stake.");
        stakers[msg.sender] = Stake(msg.sender, _amount, block.timestamp, true);
        totalStaked += _amount;
        emit BeaconStaked(msg.sender, _amount, block.timestamp);
    }

    function unstakePi() public {
        Stake memory user = stakers[msg.sender];
        require(user.active, "Wala kang kilig na naka-stake.");
        uint256 timeElapsed = block.timestamp - user.timestamp;
        uint256 reward = (user.amount * rewardRate * timeElapsed) / 31536000; // kilig reward per year
        totalStaked -= user.amount;
        stakers[msg.sender].active = false;
        emit BeaconUnstaked(msg.sender, user.amount + reward, block.timestamp);
        // Here you’d mint or transfer rewards (outside the scope of this demo)
    }
}
