contract vinDecentralAidStream {
    mapping(address => uint) public aidPool;

    event AidStreamed(address indexed donor, uint amount);

    function streamAid(uint amount) public {
        aidPool[msg.sender] += amount;
        emit AidStreamed(msg.sender, amount);
    }

    function totalAid(address donor) public view returns (uint) {
        return aidPool[donor];
    }
}
