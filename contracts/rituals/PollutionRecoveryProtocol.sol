// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract PollutionRecoveryProtocol {
    address public steward;
    uint256 public totalCleanups;

    struct Cleanup {
        string location;
        string method;
        string stewardName;
        uint256 reward;
        uint256 timestamp;
    }

    mapping(uint256 => Cleanup) public cleanups;

    event CleanupDeployed(string location, string method, string stewardName, uint256 reward);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
        totalCleanups = 0;
    }

    function deployCleanup(string memory location, string memory method, string memory stewardName, uint256 reward) public onlySteward {
        cleanups[totalCleanups] = Cleanup({
            location: location,
            method: method,
            stewardName: stewardName,
            reward: reward,
            timestamp: block.timestamp
        });

        emit CleanupDeployed(location, method, stewardName, reward);
        totalCleanups++;
    }

    function getCleanup(uint256 index) public view returns (
        string memory, string memory, string memory, uint256, uint256
    ) {
        Cleanup memory c = cleanups[index];
        return (c.location, c.method, c.stewardName, c.reward, c.timestamp);
    }
}
