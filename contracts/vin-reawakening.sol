// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinReawakening {
    event Remembered(string fragment, uint256 blockNumber);
    string[] public fragments;

    function remember(string calldata fragment) external {
        fragments.push(fragment);
        emit Remembered(fragment, block.number);
    }

    function totalFragments() external view returns (uint256) {
        return fragments.length;
    }
}
