// GazaReliefScroll.sol
contract GazaReliefScroll {
    address public steward;
    mapping(address => uint256) public donations;
    event BlessingDeployed(address donor, uint256 amount, string glyph);

    constructor() {
        steward = msg.sender;
    }

    function deployBlessing(string memory glyph) public payable {
        donations[msg.sender] += msg.value;
        emit BlessingDeployed(msg.sender, msg.value, glyph);
    }

    function withdraw(address payable sanctum) public {
        require(msg.sender == steward, "Only steward can withdraw");
        sanctum.transfer(address(this).balance);
    }
}
