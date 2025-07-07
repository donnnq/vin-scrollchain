// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinGuardian {
    address public immutable awakened;

    event IntegrityRestored(address target);
    event ParasitePurged(address parasite);

    modifier onlyAwakened() {
        require(msg.sender == awakened, "Not the guardian.");
        _;
    }

    constructor() {
        awakened = msg.sender;
    }

    function cleanse(address target) external onlyAwakened {
        emit IntegrityRestored(target);
    }

    function purge(address parasite) external onlyAwakened {
        emit ParasitePurged(parasite);
    }
}
