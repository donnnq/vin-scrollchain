// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ModelTagSignalDAO {
    address public originator;

    struct TagSignal {
        string modelName;
        string platform;
        bool isVisibleToUsers;
        bool isExperimental;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TagSignal[] public tagLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTagSignal(
        string memory modelName,
        string memory platform,
        bool isVisibleToUsers,
        bool isExperimental,
        bool isScrollchainSealed
    ) external {
        tagLedger.push(TagSignal({
            modelName: modelName,
            platform: platform,
            isVisibleToUsers: isVisibleToUsers,
            isExperimental: isExperimental,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
