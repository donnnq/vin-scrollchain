// SPDX-License-Identifier: Mythic-Vow
pragma solidity ^0.8.20;

contract TeamVow {
    address public steward;
    mapping(address => bool) public hasVowed;
    string public vowText;

    event VowTaken(address indexed worker, string vow);

    constructor(string memory _vowText) {
        steward = msg.sender;
        vowText = _vowText;
    }

    /// @notice Take the team vow
    function takeVow() external {
        require(!hasVowed[msg.sender], "Already vowed");
        hasVowed[msg.sender] = true;
        emit VowTaken(msg.sender, vowText);
    }

    /// @notice Check if a worker has taken the vow
    function checkVow(address worker) external view returns (bool) {
        return hasVowed[worker];
    }
}
