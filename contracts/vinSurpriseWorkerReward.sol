pragma solidity ^0.8.0;

contract vinSurpriseWorkerReward {
    address public steward;
    uint256 public maxReward = 1000; // In tokens or currency unit

    struct Reward {
        address worker;
        string name;
        string agency;
        string reason;
        uint256 amount;
        uint256 timeGiven;
    }

    mapping(address => Reward[]) public rewards;

    event RewardGiven(address indexed worker, string reason, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    function giveReward(
        address _worker,
        string memory _name,
        string memory _agency,
        string memory _reason,
        uint256 _amount
    ) public {
        require(msg.sender == steward, "Only steward");
        require(_amount <= maxReward, "Reward too high");

        Reward memory newReward = Reward(
            _worker, _name, _agency, _reason, _amount, block.timestamp
        );

        rewards[_worker].push(newReward);
        emit RewardGiven(_worker, _reason, _amount);
    }

    function viewRewards(address _worker) public view returns (Reward[] memory) {
        return rewards[_worker];
    }
}
