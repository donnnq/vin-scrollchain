// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivicRebalance {
    address public scrollsmith;
    mapping(address => uint256) public blessingsReceived;
    mapping(string => uint256) public injusticeLedger;

    event Rebalanced(string injustice, uint256 reclaimed, string blessing);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized to rebalance");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function logInjustice(string memory injustice, uint256 amount) public onlyScrollsmith {
        injusticeLedger[injustice] += amount;
    }

    function rebalance(string memory injustice, address recipient, string memory blessing) public onlyScrollsmith {
        uint256 amount = injusticeLedger[injustice];
        require(amount > 0, "No funds to rebalance");

        blessingsReceived[recipient] += amount;
        injusticeLedger[injustice] = 0;

        emit Rebalanced(injustice, amount, blessing);
    }

    function getBlessing(address soul) public view returns (uint256) {
        return blessingsReceived[soul];
    }
}
