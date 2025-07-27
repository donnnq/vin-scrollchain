// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

contract vinReclamationRegistry {
    address public scrollLord;

    struct FactorySoul {
        string previousIdentity;
        string newPurpose;
        uint256 targetJobs;
        bool activeRestoration;
    }

    mapping(uint256 => FactorySoul) public archive;
    uint256 public factoryCount;

    event FactoryReclaimed(uint256 indexed id, string previousIdentity, string newPurpose, uint256 jobsPromised);

    modifier onlyScrollLord() {
        require(msg.sender == scrollLord, "Uninvoked soul carrier.");
        _;
    }

    constructor() {
        scrollLord = msg.sender;
    }

    function reclaimFactory(
        string memory previousIdentity,
        string memory newPurpose,
        uint256 targetJobs
    ) public onlyScrollLord {
        archive[factoryCount] = FactorySoul(previousIdentity, newPurpose, targetJobs, true);
        emit FactoryReclaimed(factoryCount, previousIdentity, newPurpose, targetJobs);
        factoryCount++;
    }

    function viewFactory(uint256 id) public view returns (FactorySoul memory) {
        return archive[id];
    }
}
