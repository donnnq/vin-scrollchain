// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollProphecy {
    enum Status { Foretold, Fulfilled, Broken }

    struct Prophecy {
        string title;
        string omenKey;
        int256 omenThreshold;
        string condition;
        Status status;
        address foreteller;
        uint256 timestamp;
    }

    Prophecy[] public prophecies;
    address public immutable prophecyKeeper;

    event ProphecyForetold(uint256 indexed id, string title, string condition, address foreteller, uint256 timestamp);
    event ProphecyFulfilled(uint256 indexed id, uint256 timestamp);
    event ProphecyBroken(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == prophecyKeeper, "Not the prophecy keeper");
        _;
    }

    constructor() {
        prophecyKeeper = msg.sender;
    }

    function foretell(
        string calldata title,
        string calldata omenKey,
        int256 omenThreshold,
        string calldata condition
    ) external onlyKeeper {
        prophecies.push(Prophecy({
            title: title,
            omenKey: omenKey,
            omenThreshold: omenThreshold,
            condition: condition,
            status: Status.Foretold,
            foreteller: msg.sender,
            timestamp: block.timestamp
        }));

        emit ProphecyForetold(prophecies.length - 1, title, condition, msg.sender, block.timestamp);
    }

    function fulfill(uint256 id) external onlyKeeper {
        require(id < prophecies.length, "Invalid prophecy ID");
        require(prophecies[id].status == Status.Foretold, "Already resolved");
        prophecies[id].status = Status.Fulfilled;
        emit ProphecyFulfilled(id, block.timestamp);
    }

    function breakProphecy(uint256 id) external onlyKeeper {
        require(id < prophecies.length, "Invalid prophecy ID");
        require(prophecies[id].status == Status.Foretold, "Already resolved");
        prophecies[id].status = Status.Broken;
        emit ProphecyBroken(id, block.timestamp);
    }

    function getProphecy(uint256 id) external view returns (Prophecy memory) {
        require(id < prophecies.length, "Invalid prophecy ID");
        return prophecies[id];
    }

    function totalProphecies() external view returns (uint256) {
        return prophecies.length;
    }
}
