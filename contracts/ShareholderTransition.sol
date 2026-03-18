// ShareholderTransition.sol
pragma solidity ^0.8.0;

contract ShareholderTransition {
    address public soleOwner;
    mapping(address => uint256) public shares;
    uint256 public totalShares;

    event SharesBurned(address indexed shareholder, uint256 amount);
    event OwnershipMinted(address indexed newOwner, uint256 consolidatedShares);

    modifier onlyOwner() {
        require(msg.sender == soleOwner, "Not authorized");
        _;
    }

    constructor() {
        soleOwner = msg.sender; // initial deployer
    }

    // allocate shares to a shareholder
    function allocateShares(address shareholder, uint256 amount) public onlyOwner {
        shares[shareholder] += amount;
        totalShares += amount;
    }

    // burn shares of a shareholder (simulate consolidation)
    function burnShares(address shareholder, uint256 amount) public onlyOwner {
        require(shares[shareholder] >= amount, "Insufficient shares");
        shares[shareholder] -= amount;
        totalShares -= amount;
        emit SharesBurned(shareholder, amount);
    }

    // mint consolidated ownership to soleOwner
    function mintOwnership() public onlyOwner {
        uint256 consolidated = totalShares;
        totalShares = 0;
        shares[soleOwner] += consolidated;
        emit OwnershipMinted(soleOwner, consolidated);
    }
}
