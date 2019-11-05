pragma solidity >=0.4.22 <0.6.0;

contract Ownable {
  address private owner;

  constructor() internal {
    owner = msg.sender;
  }

  function isOwner() public view returns(bool) {
    return msg.sender == owner;
  }

  modifier onlyOwner() {
    require(isOwner());
    _;
  }
}

contract SimpleStore is Ownable {
  mapping (string => string) private store;

  function put(string key, string value) public onlyOwner {
    store[key] = value;
  }

  function get(string key) public view returns (string) {
    return store[key];
  }
}