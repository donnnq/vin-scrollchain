solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinBayanihanGrantScroll
/// @notice A communal “blessings” pool where declared believers can receive grants
contract vinBayanihanGrantScroll {
    address public scrollkeeper;                 // contract owner / steward
    mapping(address => bool) public believer;    // who’s declared faith
    mapping(address => uint256) public received; // total blessings received

    event FaithDeclared(address indexed believer);
    event BlessingSent(address indexed from, address indexed to, uint256 amount);
    event BlessingWithdrawn(address indexed to, uint256 amount);

    modifier onlyKeeper() {
        require(msg.sender == scrollkeeper, "Not scrollkeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Anyone can declare themselves a believer and join the ritual
    function declareFaith() external {
        require(!believer[msg.sender], "Already declared");
        believer[msg.sender] = true;
        emit FaithDeclared(msg.sender);
    }

    /// @notice Scrollkeeper funds the pool with ETH
    function fundPool() external payable onlyKeeper {
        // pool balance increases automatically
    }

    /// @notice Scrollkeeper blesses a declared believer with ETH
    function sendBlessing(address to, uint256 amount) external onlyKeeper {
        require(believer[to], "Recipient not a believer");
        require(address(this).balance >= amount, "Insufficient pool balance");

        received[to] += amount;
        payable(to).transfer(amount);
        emit BlessingSent(msg.sender, to, amount);
    }

    /// @notice Believers can check how much they’ve received so far
    function checkReceived(address who) external view returns (uint256) {
        return received[who];
    }

    /// @notice Emergency refund back to scrollkeeper if needed
    function refundAll() external onlyKeeper {
        uint256 bal = address(this).balance;
        require(bal > 0, "Nothing to refund");
        payable(scrollkeeper).transfer(bal);
    }

    /// @notice Fallback to accept direct ETH sends
    receive() external payable { }
}
