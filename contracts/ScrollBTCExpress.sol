// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ScrollBTCExpress is Ownable {
    IERC20 public immutable wbtc;        // Wrapped BTC token
    uint256 public tollFee;              // Fee (in WBTC) to unlock express lane
    mapping(address => bool) public hasFastLane;

    event TollPaid(address indexed user, uint256 amount);
    event FastLaneGranted(address indexed user);
    event BTCExpressTransfer(
        address indexed sender,
        address indexed recipient,
        uint256 amount,
        string checkpoint,
        bool express
    );
    event TollFeeUpdated(uint256 oldFee, uint256 newFee);

    constructor(IERC20 _wbtc, uint256 _initialTollFee) {
        wbtc = _wbtc;
        tollFee = _initialTollFee;
    }

    /// @notice User pays toll to unlock the fast lane
    function payToll() external {
        require(!hasFastLane[msg.sender], "Already on express lane");
        // transfer WBTC from user to this contract
        bool ok = wbtc.transferFrom(msg.sender, address(this), tollFee);
        require(ok, "WBTC transfer failed");

        hasFastLane[msg.sender] = true;
        emit TollPaid(msg.sender, tollFee);
        emit FastLaneGranted(msg.sender);
    }

    /// @notice Regular (slow) transfer: anyone can call, no toll required
    function transferRegular(
        address recipient,
        uint256 amount,
        string calldata checkpoint
    ) external {
        bool ok = wbtc.transferFrom(msg.sender, recipient, amount);
        require(ok, "WBTC transfer failed");

        emit BTCExpressTransfer(msg.sender, recipient, amount, checkpoint, false);
    }

    /// @notice Express transfer: only for toll-paying users
    function transferExpress(
        address recipient,
        uint256 amount,
        string calldata checkpoint
    ) external {
        require(hasFastLane[msg.sender], "Not in express lane");
        bool ok = wbtc.transferFrom(msg.sender, recipient, amount);
        require(ok, "WBTC transfer failed");

        emit BTCExpressTransfer(msg.sender, recipient, amount, checkpoint, true);
    }

    /// @notice Owner can update the toll fee for future users
    function updateTollFee(uint256 newFee) external onlyOwner {
        emit TollFeeUpdated(tollFee, newFee);
        tollFee = newFee;
    }

    /// @notice Owner can withdraw accumulated tolls (WBTC)
    function withdrawTolls(address to) external onlyOwner {
        uint256 bal = wbtc.balanceOf(address(this));
        require(bal > 0, "No tolls to withdraw");
        bool ok = wbtc.transfer(to, bal);
        require(ok, "WBTC withdrawal failed");
    }
}
