// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollReleaseScroll {
    address public scrollkeeper;
    string public codename = "VINVIN-KILIGSTREAM-V1";
    bool public released = false;

event ScrollReleased(address indexed author, string codename, uint256 timestamp);

modifier onlyScrollkeeper() {
    require(msg.sender == scrollkeeper, "Not scrollkeeper.");
    _;
}

constructor() {
    scrollkeeper = msg.sender;
}

function releaseScroll() external onlyScrollkeeper {
    require(!released, "Already released.");
    released = true;
    emit ScrollReleased(msg.sender, codename, block.timestamp);
}
}
