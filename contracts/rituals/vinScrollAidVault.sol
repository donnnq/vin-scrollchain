/// @title vinScrollAidVault
/// @notice Facilitates herbal aid pooling, matching donations, and verifying wellness grant claims.
contract vinScrollAidVault {
    mapping(address => uint256) public donations;
    mapping(address => uint256) public claims;
    uint256 public totalPool;

    event AidDonated(address donor, uint256 amount);
    event AidClaimed(address claimant, uint256 amount);

    function donateAid() external payable {
        donations[msg.sender] += msg.value;
        totalPool += msg.value;
        emit AidDonated(msg.sender, msg.value);
    }

    function claimAid(uint256 requestedAmount) external {
        require(requestedAmount <= totalPool / 10, "Claim exceeds fair threshold");
        claims[msg.sender] += requestedAmount;
        payable(msg.sender).transfer(requestedAmount);
        totalPool -= requestedAmount;
        emit AidClaimed(msg.sender, requestedAmount);
    }
}
